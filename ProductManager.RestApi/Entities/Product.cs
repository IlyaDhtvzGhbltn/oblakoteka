using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductManager.Entities
{
    public class Product
    {
        [Key]
        public Guid ID { get; set; }

        [MaxLength(255)]
        [Required]
        public string Name { get; set; }

        public string Description { get; set; }
    }
}
