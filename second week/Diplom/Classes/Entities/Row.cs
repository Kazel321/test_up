namespace Diplom.Classes.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Row")]
    public partial class Row
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int RowId { get; set; }

        public int HallId { get; set; }

        public virtual Hall Hall { get; set; }
    }
}
