using Diplom;
using Diplom.Classes;
using Diplom.Classes.Entities;
using Diplom.View;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Security;
using System.Windows.Forms;
using System.Drawing;

namespace UnitTestProject
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void Auth_GoToFormSeance_IsTrue()
        {
            //Arrange
            FormAuth formAuth = new FormAuth();

            //Act
            Form formRes = formAuth.Auth("123", "123");
            string res = formRes.GetType().Name;

            //Assert
            Assert.IsTrue(res == "FormSeance");
        }

        [TestMethod]
        public void OnSeance_GoToFormSeance_SeanceAreEqual()
        {
            //Arrange
            int seanceId = 1;

            //Act
            FormOrderSeance formRes = FormSeance.OnSeance(seanceId);
            Seance res = formRes.seance;

            //Assert
            Assert.AreEqual(seanceId, res.SeanceId);
        }

        [TestMethod]
        public void OnFilm_GoToFormFilm_FilmAreEqual()
        {
            //Arrange
            int filmId = 1;

            //Act
            FormFilm formRes = FormSeance.OnFilm(filmId);
            Film res = formRes.film;

            //Assert
            Assert.AreEqual(filmId, res.FilmId);
        }

        [TestMethod]
        public void OnHallView_ShowAllPlacesInHall_IsTrue()
        {
            //Arrange
            DB DB = new DB();
            int seanceId = 1;
            Seance seance = DB.Seance.Where(x => x.SeanceId == seanceId).FirstOrDefault();
            seance.HallId = 1;
            DB.SaveChanges();
            List<Place> places = DB.Place.Where(x => x.HallId == seance.HallId).ToList();

            int countPlaces = 0;

            //Act
            FormOrderSeance formOrderSeance = new FormOrderSeance(seanceId);
            DataGridView placesView = formOrderSeance.OnHallView();
            foreach (Place place in places) 
            {
                for (int i = 0; i < placesView.Rows.Count; i++)
                {
                    for (int j = 0; j < placesView.Columns.Count; j++)
                    {
                        if (place.PlaceId == (int)placesView[j, i].Tag)
                            countPlaces++;
                    }
                }
            }

            //Assert
            Assert.AreEqual(places.Count, countPlaces);
        }

        [TestMethod]
        public void FormScreenshot_ShowAllScreenshotInFilm_IsTrue()
        {
            //Arrange
            DB DB = new DB();
            int filmId = 2;
            List<Screenshot> screenshots = DB.Screenshot.Where(x => x.FilmId == filmId).ToList();

            int countScreenshots = 0;

            //Act
            FormScreenshot formScrenshot = new FormScreenshot(filmId);
            List<Screenshot> res = formScrenshot.binaryScreenshots;
            foreach (Screenshot item in screenshots)
            {
                if (res.FindIndex(x => x.ScreenshotId == item.ScreenshotId) != -1)
                    countScreenshots++;
            }

            //Assert
            Assert.AreEqual(screenshots.Count, countScreenshots);
        }
    }
}
