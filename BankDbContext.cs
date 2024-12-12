using Microsoft.EntityFrameworkCore;

public class BankDbContext : DbContext
{
    public DbSet<Transaction> Transactions { get; set; }
    public DbSet<AdminApproval> AdminApprovals { get; set; }
    public DbSet<User> Users { get; set; }
    public DbSet<TransactionLog> TransactionLogs { get; set; }
    public DbSet<Admin> Admins { get; set; }
    public DbSet<SuspiciousActivityLog> SuspiciousActivityLogs { get; set; }

    public BankDbContext(DbContextOptions<BankDbContext> options)
        : base(options) { }
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
