using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using WSUniversalLib;

namespace WSUniversalLibUnitTest
{
    [TestClass]
    public class WSUniversalLibUnitTest
    {
        [TestMethod]
        public void GetQuantityForProduct_CorrectData()
        {
            //Arrange
            Calculation cal = new Calculation();

            //Act
            int res = cal.GetQuantityForProduct(3, 1, 15, 20, 45);

            //Assert
            Assert.AreEqual(114148, res);
        }

        [TestMethod]
        public void GetQuantityForProduct_NonExistenProductType()
        {
            //Arrange
            Calculation cal = new Calculation();

            //Act
            int res = cal.GetQuantityForProduct(1000, 1, 15, 20, 45);

            //Assert
            Assert.AreEqual(-1, res);
        }

        [TestMethod]
        public void GetQuantityForProduct_NonExistenMaterialType()
        {
            //Arrange
            Calculation cal = new Calculation();

            //Act
            int res = cal.GetQuantityForProduct(3, 1000, 15, 20, 45);

            //Assert
            Assert.AreEqual(-1, res);
        }

        [TestMethod]
        public void GetQuantityForProduct_CountIsNegative()
        {
            //Arrange
            Calculation cal = new Calculation();

            //Act
            int res = cal.GetQuantityForProduct(3, 1, -1, 20, 45);

            //Assert
            Assert.AreEqual(-1, res);
        }

        [TestMethod]
        public void GetQuantityForProduct_WidthIsNegative()
        {
            //Arrange
            Calculation cal = new Calculation();

            //Act
            int res = cal.GetQuantityForProduct(3, 1, 15, -1, 45);

            //Assert
            Assert.AreEqual(-1, res);
        }

        [TestMethod]
        public void GetQuantityForProduct_LengthIsNegative()
        {
            //Arrange
            Calculation cal = new Calculation();

            //Act
            int res = cal.GetQuantityForProduct(3, 1, 15, 20, -1);

            //Assert
            Assert.AreEqual(-1, res);
        }

        [TestMethod]
        public void GetQuantityForProduct_ValueIsRoundedDown()
        {
            //Arrange
            Calculation cal = new Calculation();

            //Act
            int res = cal.GetQuantityForProduct(3, 1, 15, 20, 45);
            float koefType = 8.43f;
            float faultProc = 0.3f;

            float resCountWithFaultProc = (15 * (20 * 45) * koefType) / (1 - (faultProc / 100));
            int valueRoundedDown = (int)Math.Ceiling(resCountWithFaultProc);    

            //Assert
            Assert.AreEqual(valueRoundedDown, res);
        }

        [TestMethod]
        public void GetQuantityForProduct_CountIsNull()
        {
            //Arrange
            Calculation cal = new Calculation();

            //Act
            int res = cal.GetQuantityForProduct(3, 1, 0, 20, 45);

            //Assert
            Assert.AreEqual(-1, res);
        }

        [TestMethod]
        public void GetQuantityForProduct_WidthIsNull()
        {
            //Arrange
            Calculation cal = new Calculation();

            //Act
            int res = cal.GetQuantityForProduct(3, 1, 15, 0, 45);

            //Assert
            Assert.AreEqual(-1, res);
        }

        [TestMethod]
        public void GetQuantityForProduct_LengthIsNull()
        {
            //Arrange
            Calculation cal = new Calculation();

            //Act
            int res = cal.GetQuantityForProduct(3, 1, 15, 20, 0);

            //Assert
            Assert.AreEqual(-1, res);
        }
    }
}
