namespace Diplom.Classes.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Film")]
    public partial class Film
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Film()
        {
            Screenshot = new HashSet<Screenshot>();
            Seance = new HashSet<Seance>();
            Genre = new HashSet<Genre>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int FilmId { get; set; }

        [Required]
        public string FilmName { get; set; }

        public int CountryId { get; set; }

        public int MinAgeId { get; set; }

        public TimeSpan FilmDuration { get; set; }

        [Required]
        public string FilmDescription { get; set; }

        public int FilmYear { get; set; }

        [Column(TypeName = "image")]
        public byte[] FilmCover { get; set; }

        public virtual Country Country { get; set; }

        public virtual MinAge MinAge { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Screenshot> Screenshot { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Seance> Seance { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Genre> Genre { get; set; }
    }
}
