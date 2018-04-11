using System.ComponentModel.DataAnnotations;

namespace WebApp.Models
{
	public class QueueMessageModel
	{
		[Required]
		public string Text { get; set; }
	}
}