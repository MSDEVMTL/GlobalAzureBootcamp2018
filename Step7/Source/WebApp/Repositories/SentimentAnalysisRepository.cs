using Microsoft.Azure.Documents;
using Microsoft.Azure.Documents.Client;
using Microsoft.Azure.Documents.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using WebApp.Models;

namespace WebApp.Repositories
{
    public class SentimentAnalysisRepository
    {
        string DbId => "cognitivedb";
        string CollectionId => "sentiment";
        Uri DbUri { get; }
        Uri CollectionUri { get; }
        Uri DocAccountUri { get; }
        DocumentClient DocClient { get; }

        public SentimentAnalysisRepository(string serverUrl, string key)
        {
            DbUri = UriFactory.CreateDatabaseUri(DbId);
            CollectionUri = UriFactory.CreateDocumentCollectionUri(DbId, CollectionId);
            DocAccountUri = new Uri(serverUrl);
            DocClient = new DocumentClient(DocAccountUri, key);
        }

        public async Task<IEnumerable<SentimentAnalysisModel>> GetSentimentAnalysis()
        {
            var query = DocClient.CreateDocumentQuery<SentimentAnalysisModel>(CollectionUri).AsDocumentQuery();
            var results = new List<SentimentAnalysisModel>();
            while (query.HasMoreResults)
            {
                var resultChunk = await query.ExecuteNextAsync<SentimentAnalysisModel>();
                results.AddRange(resultChunk);
            }

            return results;
        }
    }
}