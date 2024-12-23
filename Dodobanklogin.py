request = AuthGetRequest(access_token=access_token)
response = client.auth_get(request)
numbers = response['numbers']{
  "accounts": [
    {
      "account_id": "vzeNDwK7KQIm4yEog683uElbp9GRLEFXGK98D",
      "balances": {
        "available": 100,
        "current": 110,
        "limit": null,
        "iso_currency_code": "USD",
        "unofficial_currency_code": null
      },
      "mask": "9606",
      "name": "dodo bank checking",
      "official_name": dodo bank checking",
      "subtype": "checking",
      "type": "depository"
    }
  ],
  "numbers": {
    "ach": [
      {
        "account": "9900009606",
        "account_id": "vzeNDwK7KQIm4yEog683uElbp9GRLEFXGK98D",
        "routing": "011401533",
        "wire_routing": "021000021"
      }
    ],
    "eft": [
      {
        "account": "111122223333",
        "account_id": "vzeNDwK7KQIm4yEog683uElbp9GRLEFXGK98D",
        "institution": "021",
        "branch": "01140"
      }
    ],
    "international": [
      {
        "account_id": "vzeNDwK7KQIm4yEog683uElbp9GRLEFXGK98D",
        "bic": "NWBKGB21",
        "iban": "GB29NWBK60161331926819"
      }
    ],
    "bacs": [
      {
        "account": "31926819",
        "account_id": "vzeNDwK7KQIm4yEog683uElbp9GRLEFXGK98D",
        "sort_code": "601613"
      }
    ]
  },
  "item": {
    "available_products": [
      "balance",
      "identity",
      "payment_initiation",
      "transactions"
    ],
    "billed_products": [
      "assets",
      "auth"
    ],
    "consent_expiration_time": null,
    "error": null,
    "institution_id": "ins_117650",
    "institution_name": "Dodo Bank",
    "item_id": "DWVAAPWq4RHGlEaNyGKRTAnPLaEmo8Cvq7na6",
    "update_type": "background",
    "webhook": "https://www.genericwebhookurl.com/webhook",
    "auth_method": "INSTANT_AUTH"
  },
  "request_id": "m8MDnv9okwxFNBV"request = BankTransferEventListRequest(
  start_date=start_date,
  end_date=end_date,
  bank_transfer_id=bank_transfer_id,
  account_id=account_id,
  bank_transfer_type=bank_transfer_type,
  event_types=event_types,
  count=count,
  offset=offset,
  origination_account_id=origination_account_id,
  direction=direction,
)
response = client.bank_transfer_event_list(request)
events = response['bank_transfer_events']
for event in events:
  # iterate through eventsrequest = BankTransferEventSyncRequest(
    after_id=after_id,
    count=count
)
response = client.bank_transfer_event_sync(request)
events = response["bank_transfer_events"]
for event in events:{
  "bank_transfer_events": [
    {
      "account_id": "6qL6lWoQkAfNE3mB8Kk5tAnvpX81qefrvvl7B",
      "bank_transfer_amount": "12.34",
      "bank_transfer_id": "460cbe92-2dcc-8eae-5ad6-b37d0ec90fd9",
      "bank_transfer_iso_currency_code": "USD",
      "bank_transfer_type": "credit",
      "direction": "outbound",
      "event_id": 1,
      "event_type": "pending",
      "failure_reason": null,
      "origination_account_id": "",
      "timestamp": "2020-08-06T17:27:15Z"
    }
  ],
  "request_id": "mdqfuVxeoza6mhu"
}
  # iterate through events{
  "webhook_type": "AUTH",
  "webhook_code": "DEFAULT_UPDATE",
  "item_id": "wz666MBjYWTp2PDzzggYhM6oWWmBb",
  "account_ids_with_updated_auth": {
    "BxBXxLj1m4HMXBm9WZZmCWVbPjX16EHwv99vp": [
      "ACCOUNT_NUMBER"
    ]
  },
  "error": null,
  "environment": "production"{
  "webhook_type": "AUTH",
  "webhook_code": "VERIFICATION_EXPIRED",
  "item_id": "eVBnVMp7zdTJLkRNr33Rs6zr7KNJqBFL9DrE6",
  "account_id": "BxBXxLj1m4HMXBm9WZZmCWVbPjX16EHwv99vp",{
  "webhook_type": "AUTH",
  "webhook_code": "SMS_MICRODEPOSITS_VERIFICATION",
  "status": "MANUALLY_VERIFIED",
  "item_id": "eVBnVMp7zdTJLkRNr33Rs6zr7KNJqBFL9DrE6",
  "account_id": "dVzbVMLjrxTnLjX4G66XUp5GLklm4oiZy88yK",
  "environment": "sandbox"
}
  "environment": "production",
  "error": null
}
}
}
