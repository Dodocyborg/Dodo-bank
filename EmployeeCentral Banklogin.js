document.getElementById('getBankInfoBtn').addEventListener('click', function() {
    // Get the access token entered by the user
    const accessToken = document.getElementById('access_token').value;

    // Validate if the access token is provided
    if (!accessToken) {
        document.getElementById('result').innerHTML = '<p class="error">Please provide a valid access token.</p>';
        return;
    }

    // Prepare the request data
    const requestData = {
        access_token: accessToken
    };

    // Send an AJAX request to the Flask backend to get bank info
    fetch('/auth', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(requestData)
    })
    .then(response => response.json()) // Convert the response to JSON
    .then(data => {
        // Check if data contains accounts and display them
        if (data && data.accounts) {
            let output = '<h2>Bank Accounts Information</h2>';
            data.accounts.forEach(account => {
                output += `
                    <p><strong>Account Name:</strong> ${account.name}</p>
                    <p><strong>Account ID:</strong> ${account.account_id}</p>
                    <p><strong>Available Balance:</strong> ${account.balances.available} ${account.balances.iso_currency_code}</p>
                    <p><strong>Account Type:</strong> ${account.type}</p>
                    <hr>
                `;
            });
            document.getElementById('result').innerHTML = output;
        } else {
            // If no accounts found, show an error message
            document.getElementById('result').innerHTML = '<p class="error">No bank accounts found.</p>';
        }
    })
    .catch(error => {
        // If there's an error with the request, display it
        document.getElementById('result').innerHTML = `<p class="error">Error: ${error.message}</p>`;
    });
});
