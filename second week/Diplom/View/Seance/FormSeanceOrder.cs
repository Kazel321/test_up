using Diplom.Classes;
using Diplom.Classes.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using ZXing;
using Word = Microsoft.Office.Interop.Word;

namespace Diplom
{
    public partial class FormOrderSeance : Form
    {
        public Seance seance;
        List<Ticket> tickets = new List<Ticket>();
        Random rand = new Random();
        double sumTickets;

        public FormOrderSeance()
        {
            InitializeComponent();
        }

        public FormOrderSeance(int seanceId)
        {
            Helper.DB = new DB();
            seance = Helper.DB.Seance.Where(x => x.SeanceId == seanceId).FirstOrDefault();
            InitializeComponent();
        }


        /// <summary>
        /// Вернутся
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonReturn_Click(object sender, EventArgs e)
        {
            Close();
        }

        /// <summary>
        /// Загрузка формы
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void FormOrderSeance_Load(object sender, EventArgs e)
        {
            Film film = seance.Film;
            this.Text = film.FilmName;
            labelTitle.Text = film.FilmName + ", " + seance.HallId + "-й зал, " + seance.SeanceDate.ToLongDateString() + ", " + seance.SeanceTime;

            List<Place> places = Helper.DB.Place.Where(x => x.HallId == seance.HallId).ToList();
            var rows = places.GroupBy(x => x.PlaceRow).ToArray();
            int maxNumber = places.Max(x => x.PlaceNumber);

            dataGridViewPlaces.RowCount = rows.Length;
            dataGridViewPlaces.ColumnCount = maxNumber;
            dataGridViewPlaces.DefaultCellStyle.Tag = null;
            dataGridViewPlaces.DefaultCellStyle.BackColor = Color.DarkGray;
            dataGridViewPlaces.DefaultCellStyle.SelectionBackColor = Color.DarkGray;

            int maxPlaceRowNumber;
            int startPlace;
            int rowHeight = (dataGridViewPlaces.Size.Height - dataGridViewPlaces.ColumnHeadersHeight) / dataGridViewPlaces.RowCount;

            for (int i = 0; i < rows.Length; i++)
            {
                dataGridViewPlaces.Rows[i].HeaderCell.Value = (i + 1).ToString();
                dataGridViewPlaces.Rows[i].Height = rowHeight;
                maxPlaceRowNumber = places.Where(x => x.PlaceRow == i + 1).Max(x => x.PlaceNumber);
                startPlace = (maxNumber - maxPlaceRowNumber) / 2;
                for (int j = 0; j < maxPlaceRowNumber; j++)
                {
                    Place place = places.Where(x => x.PlaceRow == (i + 1) && x.PlaceNumber == (j + 1)).FirstOrDefault();
                    dataGridViewPlaces[j + startPlace, i].Tag = place.PlaceId;
                    dataGridViewPlaces[j + startPlace, i].ToolTipText = "Ряд " + place.PlaceRow + ", Место " + place.PlaceNumber;

                    var isBusy = Helper.DB.Ticket.Where(x => x.PlaceId == place.PlaceId && x.SeanceId == seance.SeanceId).FirstOrDefault();
                    if (isBusy == null)
                    {
                        dataGridViewPlaces[j + startPlace, i].Style.BackColor = Color.Green;
                        dataGridViewPlaces[j + startPlace, i].Style.SelectionBackColor = SystemColors.Highlight;
                    }
                    else
                    {
                        dataGridViewPlaces[j + startPlace, i].Style.BackColor = Color.Red;
                        dataGridViewPlaces[j + startPlace, i].Style.SelectionBackColor = Color.Red;
                    }
                }
            }

            for (int i = 0; i < dataGridViewPlaces.Columns.Count; i++)
            {
                dataGridViewPlaces.Columns[i].HeaderText = (i + 1).ToString();
            }

            dataGridViewPlaces.ClearSelection();
        }

        public DataGridView OnHallView()
        {
            DataGridView dataGridView = new DataGridView();

            Helper.DB = new DB();

            List<Place> places = Helper.DB.Place.Where(x => x.HallId == seance.HallId).ToList();
            var rows = places.GroupBy(x => x.PlaceRow).ToArray();
            int maxNumber = places.Max(x => x.PlaceNumber);

            dataGridView.RowCount = rows.Length;
            dataGridView.ColumnCount = maxNumber;
            dataGridView.DefaultCellStyle.Tag = null;
            dataGridView.DefaultCellStyle.BackColor = Color.DarkGray;
            dataGridView.DefaultCellStyle.SelectionBackColor = Color.DarkGray;

            int maxPlaceRowNumber;
            int startPlace;
            int rowHeight = (dataGridView.Size.Height - dataGridView.ColumnHeadersHeight) / dataGridView.RowCount;

            for (int i = 0; i < rows.Length; i++)
            {
                dataGridView.Rows[i].HeaderCell.Value = (i + 1).ToString();
                dataGridView.Rows[i].Height = rowHeight;
                maxPlaceRowNumber = places.Where(x => x.PlaceRow == i + 1).Max(x => x.PlaceNumber);
                startPlace = (maxNumber - maxPlaceRowNumber) / 2;
                for (int j = 0; j < maxPlaceRowNumber; j++)
                {
                    Place place = places.Where(x => x.PlaceRow == (i + 1) && x.PlaceNumber == (j + 1)).FirstOrDefault();
                    dataGridView[j + startPlace, i].Tag = place.PlaceId;
                    dataGridView[j + startPlace, i].ToolTipText = "Ряд " + place.PlaceRow + ", Место " + place.PlaceNumber;

                    var isBusy = Helper.DB.Ticket.Where(x => x.PlaceId == place.PlaceId && x.SeanceId == seance.SeanceId).FirstOrDefault();
                    if (isBusy == null)
                    {
                        dataGridView[j + startPlace, i].Style.BackColor = Color.Green;
                        dataGridView[j + startPlace, i].Style.SelectionBackColor = SystemColors.Highlight;
                    }
                    else
                    {
                        dataGridView[j + startPlace, i].Style.BackColor = Color.Red;
                        dataGridView[j + startPlace, i].Style.SelectionBackColor = Color.Red;
                    }
                }
            }

            for (int i = 0; i < dataGridView.Columns.Count; i++)
            {
                dataGridView.Columns[i].HeaderText = (i + 1).ToString();
            }

            dataGridView.ClearSelection();

            return dataGridView;
        }

        /// <summary>
        /// Купить билет
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonBuy_Click(object sender, EventArgs e)
        {
            //if (tickets.Count == 0)
            //{
            //    MessageBox.Show("Вы не выбрали ни одного места", "Покупка билетов", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    return;
            //}

            //string code;

            //for (int i = 0; i < tickets.Count; i++)
            //{
            //    tickets[i].TicketDateTime = DateTime.Now;

            //    do
            //    {
            //        code = rand.Next(100000, 1000000).ToString();
            //    }
            //    while (Helper.DB.Ticket.Where(x => x.TicketCode == code).FirstOrDefault() != null);
            //    tickets[i].TicketCode = code;
            //    if (Helper.DB.Ticket.Count() != 0) tickets[i].TicketId = Helper.DB.Ticket.Max(x => x.TicketId) + i + 1;
            //    else tickets[i].TicketId = 1;
            //    generateCheck(tickets[i]);
            //    Helper.DB.Ticket.Add(tickets[i]);
            //}

            //Helper.DB.SaveChanges();

            //MessageBox.Show("Покупка проведена успешно", "Покупка билетов", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //Close();

            if (tickets.Count == 0)
            {
                MessageBox.Show("Вы не выбрали ни одного места", "Покупка билетов", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            Thread thread = new Thread(buy);
            buttonBuy.Text = "Загрузка...";
            thread.Start();
        }

        private void buy()
        {
            string code;

            for (int i = 0; i < tickets.Count; i++)
            {
                tickets[i].TicketDateTime = DateTime.Now;

                do
                {
                    code = rand.Next(100000, 1000000).ToString();
                }
                while (Helper.DB.Ticket.Where(x => x.TicketCode == code).FirstOrDefault() != null);
                tickets[i].TicketCode = code;
                if (Helper.DB.Ticket.Count() != 0) tickets[i].TicketId = Helper.DB.Ticket.Max(x => x.TicketId) + i + 1;
                else tickets[i].TicketId = i + 1;
                generateCheck(tickets[i]);
                Helper.DB.Ticket.Add(tickets[i]);
            }

            Helper.DB.SaveChanges();

            MessageBox.Show("Покупка проведена успешно", "Покупка билетов", MessageBoxButtons.OK, MessageBoxIcon.Information);
            BeginInvoke(new MethodInvoker(() => Close()));
        }

        /// <summary>
        /// Выбор места
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dataGridViewPlaces_SelectionChanged(object sender, EventArgs e)
        {
            tickets.Clear();
            sumTickets = 0;

            for (int i = 0; i < dataGridViewPlaces.SelectedCells.Count; i++)
            {
                if (dataGridViewPlaces.SelectedCells[i].Style.BackColor == Color.Green)
                {
                    Ticket ticket = new Ticket();
                    int placeId = (int)dataGridViewPlaces.SelectedCells[i].Tag;
                    Place place = Helper.DB.Place.Where(x => x.PlaceId == placeId).FirstOrDefault();
                    ticket.Place = place;
                    ticket.Seance = seance;
                    ticket.TicketCost = seance.SeanceCost + place.PlaceType.PlaceTypeCost;
                    sumTickets += ticket.TicketCost;
                    tickets.Add(ticket);
                }
            }

            labelCount.Text = "Количество билетов: " + tickets.Count;
            labelCost.Text = "Стоимость: " + sumTickets.ToString("C2");
        }

        /// <summary>
        /// Генерация чека
        /// </summary>
        /// <param name="code"></param>
        void generateCheck(Ticket ticket)
        {
            Word.Application wordApp = new Word.Application();
            Word.Document wordDoc = wordApp.Documents.Add();
            wordDoc.PageSetup.PaperSize = Word.WdPaperSize.wdPaperCustom;
            wordDoc.PageSetup.LeftMargin = 10;
            wordDoc.PageSetup.BottomMargin = 5;
            wordDoc.PageSetup.RightMargin = 10;
            wordDoc.PageSetup.TopMargin = 5;

            wordDoc.PageSetup.SetAsTemplateDefault();
            wordDoc.PageSetup.PageWidth = 250;
            wordDoc.PageSetup.PageHeight = 305;

            Word.InlineShape wordInlineShape;
            Word.Shape wordShape;
            Word.Range wordRange;
            Word.Paragraph wordPar;

            wordPar = wordDoc.Paragraphs.Add();
            wordRange = wordPar.Range;
            generateBarcode(ticket.TicketDateTime.ToShortDateString().Replace(".", "") + ticket.TicketDateTime.ToShortTimeString().Replace(":", "") + ticket.TicketCode).Save("temp");
            wordInlineShape = wordDoc.InlineShapes.AddPicture(Application.StartupPath + "\\temp", Type.Missing, Type.Missing, wordRange);
            File.Delete(Application.StartupPath + "\\temp");
            wordInlineShape.Width = 230;
            wordInlineShape.Height = 50;
            wordRange.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
            wordRange.ParagraphFormat.SpaceAfter = 0;
            wordRange.InsertParagraphAfter();

            wordShape = wordDoc.Shapes.AddLine(0, 65, 250, 65);
            wordShape.Line.DashStyle = Microsoft.Office.Core.MsoLineDashStyle.msoLineLongDash;
            wordShape.Line.ForeColor.RGB = ColorTranslator.ToOle(Color.FromArgb(0, 0, 0));

            //film
            wordPar = wordDoc.Paragraphs.Add();
            wordRange = wordPar.Range;
            wordRange.Text = seance.Film.FilmName + " (" + seance.Film.MinAge.MinAgeValue + "+)";
            wordPar.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
            wordRange.Font.Size = 16;
            wordRange.Font.Bold = 1;
            wordRange.InsertParagraphAfter();

            //date
            wordPar = wordDoc.Paragraphs.Add();
            wordPar.Range.Text = "Дата: " + seance.SeanceDate.ToShortDateString();

            wordPar.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
            wordPar.Range.Font.Size = 14;
            wordPar.Range.Font.Bold = 0;
            wordRange = wordDoc.Range(wordPar.Range.Start + wordPar.Range.Text.IndexOf(":") + 1, wordPar.Range.End);
            wordRange.Font.Size = 16;
            wordRange.Font.Bold = 1;
            wordPar.Range.InsertParagraphAfter();

            //time
            wordPar = wordDoc.Paragraphs.Add();
            wordPar.Range.Text = "Время: " + seance.SeanceTime;
            wordPar.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
            wordPar.Range.Font.Size = 14;
            wordPar.Range.Font.Bold = 0;
            wordRange = wordDoc.Range(wordPar.Range.Start + wordPar.Range.Text.IndexOf(":"), wordPar.Range.End);
            wordRange.Font.Size = 16;
            wordRange.Font.Bold = 1;
            wordPar.Range.InsertParagraphAfter();

            //Hall
            wordPar = wordDoc.Paragraphs.Add();
            wordPar.Range.Text = "Зал: " + seance.HallId;
            wordPar.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
            wordPar.Range.Font.Size = 14;
            wordPar.Range.Font.Bold = 0;
            wordRange = wordDoc.Range(wordPar.Range.Start + wordPar.Range.Text.IndexOf(":"), wordPar.Range.End);
            wordRange.Font.Size = 16;
            wordRange.Font.Bold = 1;
            wordPar.Range.InsertParagraphAfter();

            //Place
            wordPar = wordDoc.Paragraphs.Add();
            wordPar.Range.Text = "Ряд: " + ticket.Place.PlaceRow + " Место: " + ticket.Place.PlaceNumber;
            wordPar.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
            wordPar.Range.Font.Size = 14;
            wordPar.Range.Font.Bold = 0;
            wordRange = wordDoc.Range(wordPar.Range.Start + wordPar.Range.Text.IndexOf(":"), wordPar.Range.Start + wordPar.Range.Text.IndexOf("М"));
            wordRange.Font.Size = 16;
            wordRange.Font.Bold = 1;
            wordRange = wordDoc.Range(wordPar.Range.Start + wordPar.Range.Text.LastIndexOf(":"), wordPar.Range.End);
            wordRange.Font.Size = 16;
            wordRange.Font.Bold = 1;
            wordPar.SpaceAfter = 11;
            wordPar.Range.InsertParagraphAfter();

            //Operator
            wordPar = wordDoc.Paragraphs.Add();
            wordPar.Range.Text = "Оператор: " + Helper.User.UserLastName + " " + Helper.User.UserFirstName + " " + Helper.User.UserPatronymic;
            wordPar.Format.SpaceAfter = 0;
            wordPar.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
            wordPar.Range.Font.Size = 10;
            wordPar.Range.Font.Bold = 0;
            wordPar.Range.InsertParagraphAfter();

            //OrderDate
            wordPar = wordDoc.Paragraphs.Add();
            wordPar.Range.Text = "Продажа: " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
            wordPar.Format.SpaceAfter = 0;
            wordPar.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
            wordPar.Range.Font.Size = 10;
            wordPar.Range.Font.Bold = 0;
            wordPar.Range.InsertParagraphAfter();

            //OrderNum
            wordPar = wordDoc.Paragraphs.Add();
            wordPar.Range.Text = "Заказ №: " + ticket.TicketId + " Цена: " + ticket.TicketCost.ToString("C2");
            wordPar.Format.SpaceAfter = 0;
            wordPar.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
            wordPar.Range.Font.Size = 10;
            wordPar.Range.Font.Bold = 0;
            wordPar.Range.InsertParagraphAfter();

            wordDoc.Saved = true;
            string seancetime = seance.SeanceTime.ToString().Substring(0, 5).Replace(":","_");
            string savePath = Application.StartupPath + "\\tickets\\" + "Сеанс-" + seance.Film.FilmName + ", Время-" + seancetime + ", Билет-Ряд" + ticket.Place.PlaceRow + "Место" + ticket.Place.PlaceNumber + ".pdf";
            //wordDoc.SaveAs2(Application.StartupPath + "\\tickets\\" + "Сеанс-" + seance.SeanceId + " Билет-" + ticket.TicketId + ".pdf", Word.WdExportFormat.wdExportFormatPDF);
            wordDoc.SaveAs2(savePath, Word.WdExportFormat.wdExportFormatPDF);

            wordDoc.Close(true, null, null);
            wordApp.Quit();

            releaseObject(wordApp);
            releaseObject(wordDoc);
        }

        /// <summary>
        /// Генерация штрих-кода
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        Bitmap generateBarcode(string s)
        {
            BarcodeWriter barcodeWriter = new BarcodeWriter()
            {
                Format = BarcodeFormat.CODE_128,
                Options = new ZXing.Common.EncodingOptions
                {
                    PureBarcode = true,
                }
            };

            Bitmap bmp = barcodeWriter.Write(s);
            return bmp;
        }

        /// <summary>
        /// Очистка объекта
        /// </summary>
        /// <param name="obj"></param>
        void releaseObject(object obj)
        {
            try
            {
                System.Runtime.InteropServices.Marshal.ReleaseComObject(obj);
                obj = null;
            }
            catch (Exception)
            {
                obj = null;
            }
            finally
            {
                GC.Collect();
            }
        }
    }
}
