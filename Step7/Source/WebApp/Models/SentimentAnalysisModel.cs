namespace WebApp.Models
{
    public class SentimentAnalysisModel
    {
        public string message { get; set; }

        public double sentimentScore { get; set; }

        public string language { get; set; }
    }
}
