using Diplom.Classes;
using Diplom.Classes.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Diplom
{
    public partial class FormDataSeance : Form
    {
        public FormDataSeance()
        {
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
        private void FormDataSeance_Load(object sender, EventArgs e)
        {
            int hallCount = Helper.DB.Hall.Count();
            comboBoxHall.Items.Add("без фильтра");
            comboBoxHall.SelectedIndex = 0;
            for (int i = 0; i < hallCount; i++)
            {
                comboBoxHall.Items.Add("Зал " + (i + 1));
            }
            update();
        }

        /// <summary>
        /// Обновление таблицы
        /// </summary>
        private void update()
        {
            dataGridView.Rows.Clear();

            var seances = Helper.DB.Seance.ToList();

            if (dateTimePickerDate.Checked) seances = seances.Where(x => x.SeanceDate == dateTimePickerDate.Value.Date).ToList();
            if (comboBoxHall.SelectedIndex != 0) seances = seances.Where(x => x.HallId == comboBoxHall.SelectedIndex).ToList();
            if (!String.IsNullOrEmpty(textBoxSearch.Text)) seances = seances.Where(x => x.Film.FilmName.Contains(textBoxSearch.Text)).ToList();

            int ind = -1;

            foreach (var item in seances)
            {
                ind = dataGridView.Rows.Add();
                dataGridView[0, ind].Value = item.SeanceId;
                dataGridView[1, ind].Value = item.Film.FilmName;
                dataGridView[2, ind].Value = "Зал " + item.HallId;
                dataGridView[3, ind].Value = item.SeanceDate.ToLongDateString();
                dataGridView[4, ind].Value = item.SeanceTime;
                dataGridView[5, ind].Value = item.SeanceCost.ToString("C2");
            }

            labelCount.Text = "Количество: " + (ind + 1) + " из " + Helper.DB.Seance.Count();
        }

        /// <summary>
        /// Добавить
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonAdd_Click(object sender, EventArgs e)
        {
            Form form = null;
            Button button = (Button)sender;
            if (button.Text == buttonAdd.Text)
            {
                form = null;
                Helper.formEvents = FormEvents.Добавление;
            }
            else
            {
                form = null;
                Helper.formEvents = FormEvents.Редактирование;
            }

            Hide();
            form.ShowDialog();
            Show();
        }

        /// <summary>
        /// Удалить
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonDelete_Click(object sender, EventArgs e)
        {
            Helper.DB.SaveChanges();
        }

        private void Filter(object sender, EventArgs e)
        {
            update();
        }
    }
}
