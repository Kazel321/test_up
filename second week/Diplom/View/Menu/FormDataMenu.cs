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
    public partial class FormDataMenu : Form
    {
        public FormDataMenu()
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
        /// Переход на следующую форму
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonNext_Click(object sender, EventArgs e)
        {
            Form nextForm = null;
            Button button = (Button)sender;
            string next = button.Tag.ToString();
            switch (next)
            {
                case "User":
                    nextForm = new FormDataUser();
                    break;
                case "Film":

                    break;
                case "Seance":
                    nextForm = new FormDataSeance();
                    break;
                case "Hall":

                    break;
                case "Ticket":

                    break;
            }
            Hide();
            nextForm.ShowDialog();
            Show();
        }
    }
}
