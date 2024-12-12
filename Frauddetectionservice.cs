public class FraudDetectionService
{
    private const decimal HighAmountThreshold = 10000; // Example: High amount is > $10,000
    private const int RapidTransactionThreshold = 3; // Number of transactions in a short time to consider rapid
    private const int RapidTransactionTimeFrameInMinutes = 5; // Time window in minutes for rapid transactions

    // This method checks if a transaction is fraudulent based on amount and rapid transactions
    public bool IsTransactionFraudulent(Transaction currentTransaction, List<Transaction> recentTransactions)
    {
        // Check if the transaction is a high amount
        if (currentTransaction.Amount > HighAmountThreshold)
        {
            return true; // Flag high amount transactions
        }

        // Check for rapid transactions (multiple transactions in a short period)
        if (IsRapidTransaction(currentTransaction, recentTransactions))
        {
            return true; // Flag rapid transactions
        }

        return false; // No fraud detected
    }

    // This method checks if a transaction is part of a rapid transaction pattern
    private bool IsRapidTransaction(Transaction currentTransaction, List<Transaction> recentTransactions)
    {
        // Get transactions that happened within the last RapidTransactionTimeFrameInMinutes
        var rapidTransactions = recentTransactions
            .Where(t => (currentTransaction.CreatedAt - t.CreatedAt).TotalMinutes <= RapidTransactionTimeFrameInMinutes)
            .ToList();

        // If there are more than the allowed threshold of rapid transactions, flag it
        return rapidTransactions.Count >= RapidTransactionThreshold;
    }
}public class Transaction
{
    public int TransactionId { get; set; }
    public int AccountId { get; set; }
    public decimal Amount { get; set; }
    public string Status { get; set; }
    public bool FraudFlag { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
}

public class AdminApproval
{
    public int ApprovalId { get; set; }
    public int TransactionId { get; set; }
    public string Status { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime? ReviewedAt { get; set; }
    public Transaction Transaction { get; set; }
}

public class User
{
    public int UserId { get; set; }
    public string Username { get; set; }
    public string PasswordHash { get; set; }
    public string Email { get; set; }
    public string FullName { get; set; }
    public DateTime CreatedAt { get; set; }
}

public class TransactionLog
{
    public int LogId { get; set; }
    public int TransactionId { get; set; }
    public string LogMessage { get; set; }
    public DateTime CreatedAt { get; set; }
    public Transaction Transaction { get; set; }
}

public class Admin
{
    public int AdminId { get; set; }
    public string Username { get; set; }
    public string PasswordHash { get; set; }
    public string FullName { get; set; }
    public DateTime CreatedAt { get; set; }
}

public class SuspiciousActivityLog
{
    public int LogId { get; set; }
    public int TransactionId { get; set; }
    public string SuspiciousReason { get; set; }
    public DateTime DetectedAt { get; set; }
    public Transaction Transaction { get; set; }
}
