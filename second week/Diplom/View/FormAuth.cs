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
using System.Windows.Controls.Primitives;
using System.Windows.Forms;
using ZXing;
using ZXing.OneD;

namespace Diplom.View
{
    public partial class FormAuth : Form
    {
        public FormAuth()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Изменение флажка отображения пароля
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void checkBoxShowPassword_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBoxShowPassword.Checked == true)
                textBoxPassword.PasswordChar = '\0';

            else
                textBoxPassword.PasswordChar = '*';
        }

        /// <summary>
        /// Авторизация
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonEnter_Click(object sender, EventArgs e)
        {
            string login = textBoxLogin.Text;
            string passwd = textBoxPassword.Text;
            User user = null;
            try
            {
                user = Helper.DB.User.Where(x => (x.UserLogin == login && x.UserPassword == passwd) || (x.UserEmail == login && x.UserPassword == passwd)).FirstOrDefault();
            }
            catch
            {
                MessageBox.Show("Произошла ошибка при соединении с базой данных", "Авторизация", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (user != null)
            {
                if (user.UserActive)
                {
                    Helper.User = user;
                    Login newLogin = new Login();
                    newLogin.LoginId = Helper.DB.Login.Count() + 1;
                    newLogin.User = user;
                    newLogin.LoginDateTime = DateTime.Now;
                    Helper.DB.Login.Add(newLogin);
                    Helper.DB.SaveChanges();
                    Hide();
                    MessageBox.Show("Вы вошли с ролью: " + user.Role.RoleName, "Авторизация", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Form form = null;
                    if (user.RoleId == 1)
                    {
                        form = new FormSeance();
                    }
                    else
                    {
                        form = new FormAdminMenu();
                    }
                    form.ShowDialog();
                    Show();
                }
                else
                {
                    MessageBox.Show("Вы заблокированы в системе", "Авторизация", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Неверный логин или пароль", "Авторизация", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public Form Auth(string login, string password)
        {
            Form form = null;

            User user = null;
            Helper.DB = new DB();
            user = Helper.DB.User.Where(x => (x.UserLogin == login && x.UserPassword == login) || (x.UserEmail == login && x.UserPassword == password)).FirstOrDefault();

            if (user != null)
            {
                if (user.RoleId == 1)
                    form = new FormSeance();
                else
                    form = new FormAdminMenu();
            }

            return form;
        }

        /// <summary>
        /// Вернуться
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonCancel_Click(object sender, EventArgs e)
        {
            Close();
        }

        /// <summary>
        /// Нажатие клавиши
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void FormAuth_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                buttonEnter_Click(null, null);
        }

        private void button_MouseEnter(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            b.FlatStyle = FlatStyle.Popup;
        }

        private void button_MouseLeave(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            b.FlatStyle = FlatStyle.Flat;
        }
    }
}
