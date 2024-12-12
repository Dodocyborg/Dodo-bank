public class TransactionBackgroundService : BackgroundService
{
    private readonly IServiceProvider _serviceProvider;

    public TransactionBackgroundService(IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
    }

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        while (!stoppingToken.IsCancellationRequested)
        {
            using (var scope = _serviceProvider.CreateScope())
            {
                var processor = scope.ServiceProvider.GetRequiredService<TransactionProcessor>();
                var context = scope.ServiceProvider.GetRequiredService<BankDbContext>();

                // Process pending transactions
                var pendingTransactions = context.Transactions
                    .Where(t => t.Status == "Pending Approval")
                    .ToList();

                foreach (var transaction in pendingTransactions)
                {
                    await processor.ProcessTransactionAsync(transaction);
                }
            }

            await Task.Delay(5000, stoppingToken); // Check every 5 seconds
        }
    }
}
