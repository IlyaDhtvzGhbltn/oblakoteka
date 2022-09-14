using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductManager.Entities
{
    public class ProductVersion
    {
        [Key]
        public Guid ID { get; set; }

        [Required]
        public Guid ProductID  { get; set; }
        [ForeignKey("ProductID")]
        public Product Product { get; set; }


        [Required]
        [MaxLength(255)]
        public string Name  { get; set; }

        public string Description { get; set; }

        [Required]
        public DateTime CreatingDate { get; set; }

        [Required]
        [Range(0, float.MaxValue)]
        public float Width { get; set; }        
        
        [Required]
        [Range(0, float.MaxValue)]
        public float Height  { get; set; }        
        
        [Required]
        [Range(0, float.MaxValue)]
        public float Length { get; set; }
    }
}
