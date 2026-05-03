#!/bin/bash
# install.sh for Slack CLI
echo "Installing Slack CLI..."
curl -fsSL https://downloads.slack-edge.com/slack-cli/install.sh | bash
echo "Done. Run './run.sh --action login' to authenticate."
