namespace Diplom.Classes.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Screenshot")]
    public partial class Screenshot
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ScreenshotId { get; set; }

        public int FilmId { get; set; }

        [Column(TypeName = "image")]
        public byte[] ScreenshotImage { get; set; }

        public virtual Film Film { get; set; }
    }
}
