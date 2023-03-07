namespace Diplom.Classes.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Ticket")]
    public partial class Ticket
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int TicketId { get; set; }

        public int SeanceId { get; set; }

        public DateTime TicketDateTime { get; set; }

        public int PlaceId { get; set; }

        public double TicketCost { get; set; }

        [Required]
        [StringLength(6)]
        public string TicketCode { get; set; }

        public virtual Place Place { get; set; }

        public virtual Seance Seance { get; set; }
    }
}
