docker run -e AZP_URL=https://dev.azure.com/madelemchico/samtel-devops \
           -e AZP_TOKEN=<your-personal-access-token> \
           -e AZP_POOL=Self-hosted-MADELEM \
           -e AZP_AGENT_NAME=azure-devops-self-hosted-agent \
           -v /var/run/docker.sock:/var/run/docker.sock \
           -it azure-devops-self-hosted-agent:latest