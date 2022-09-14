using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductManager.Entities
{
    public class EventLog
    {
        [Key]
        public Guid ID { get; set; }

        [Required]
        public DateTime EventDate { get; set; }

        public string Description { get; set; }
    }
}
