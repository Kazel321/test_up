using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace WSUniversalLib
{
    public class Calculation
    {
        public int GetQuantityForProduct(int productType, int materialType, int count, float width, float length)
        {
            if (count < 0 || width < 0 || length < 0) return -1;
            
            float koefType = 0;
            switch (productType) 
            {
                case 1:
                    koefType = 1.1f;
                    break;
                case 2:
                    koefType = 2.5f;
                    break;
                case 3:
                    koefType = 8.43f;
                    break;
                default: return -1;
            }

            float brakProcent = 0;
            switch (materialType)
            {
                case 1:
                    brakProcent = 0.3f;
                    break;
                case 2:
                    brakProcent = 0.12f;
                    break;
                default: return -1;
            }

            float area = width * length;

            float needCount = count * area * koefType;

            float faultCount = needCount / (1 - (brakProcent / 100));

            return (int)(Math.Ceiling(faultCount));
        }
    }
}
