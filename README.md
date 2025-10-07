# latex-template
A General Template for writing a Thesis in Latex on a Windows WSL Backend.

## Auto Deploy PDF on Discord
Use a Github Action to automatically compile the project and upload compiled pdf on your discord channel.

1. Setup Discord
    - In any Discord Channel you want go to Edit Channel -> Integrations -> Webhooks -> New Webhook
    - Copy the Webhook URL
2. Create Repository Secret
    - In your GitHub Repo go to Settings -> Secrets and Variables -> Actions -> New Repository Secret
    - Name: `DISCORD_WEBHOOK`
    - Secret: `<paste Webhook URL you copied from discord>`
    - Click Add secret