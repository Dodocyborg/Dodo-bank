public class Transaction
{
    public int TransactionId { get; set; }
    public int AccountId { get; set; }
    public decimal Amount { get; set; }
    public string TransactionType { get; set; }
    public string Status { get; set; } = "Pending"; // Pending, Approved, Declined
    public bool FraudFlag { get; set; } = false;
    public DateTime CreatedAt { get; set; } = DateTime.Now;
}
