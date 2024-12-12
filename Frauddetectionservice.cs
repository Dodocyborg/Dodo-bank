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
}
