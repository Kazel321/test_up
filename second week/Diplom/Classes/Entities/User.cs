namespace Diplom.Classes.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            Login = new HashSet<Login>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UserId { get; set; }

        public int RoleId { get; set; }

        [Required]
        public string UserLogin { get; set; }

        [Required]
        public string UserEmail { get; set; }

        [Required]
        public string UserPassword { get; set; }

        [Required]
        public string UserLastName { get; set; }

        [Required]
        public string UserFirstName { get; set; }

        [Required]
        public string UserPatronymic { get; set; }

        [Required]
        [StringLength(15)]
        public string UserPhoneNumber { get; set; }

        [Column(TypeName = "date")]
        public DateTime UserBirthDate { get; set; }

        public bool UserActive { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Login> Login { get; set; }

        public virtual Role Role { get; set; }
    }
}
