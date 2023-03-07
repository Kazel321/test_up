namespace Diplom.Classes.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PlaceType")]
    public partial class PlaceType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PlaceType()
        {
            Place = new HashSet<Place>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PlaceTypeId { get; set; }

        [Required]
        public string PlaceTypeName { get; set; }

        public double PlaceTypeCost { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Place> Place { get; set; }
    }
}
