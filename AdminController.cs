[Route("Admin")]
public class AdminController : Controller
{
    private readonly BankDbContext _context;

    public AdminController(BankDbContext context)
    {
        _context = context;
    }

    [HttpGet("Approvals")]
    public IActionResult Approvals()
    {
        var pendingApprovals = _context.AdminApprovals
            .Include(a => a.Transaction)
            .Where(a => a.Status == "Pending")
            .ToList();
        return View(pendingApprovals);
    }

    [HttpPost("ApproveTransaction")]
    public async Task<IActionResult> ApproveTransaction(int transactionId, bool isApproved)
    {
        var approval = _context.AdminApprovals
            .FirstOrDefault(a => a.TransactionId == transactionId);

        if (approval == null)
            return NotFound("Approval request not found");

        approval.Status = isApproved ? "Approved" : "Declined";
        approval.ReviewedAt = DateTime.Now;

        var transaction = _context.Transactions.Find(transactionId);
        transaction.Status = approval.Status;

        await _context.SaveChangesAsync();
        return RedirectToAction("Approvals");
    }
}
