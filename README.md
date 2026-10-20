# Coralogix Labs

Reusable configuration for Coralogix / OpenTelemetry lab environments.

## Layout

```text
coralogix-labs/
├── README.md
├── .gitignore
├── .env.example
├── labs/
│   └── otel-demo/
│       ├── README.md
│       ├── coralogix-values.yaml
│       └── otel-demo-overrides.yaml
└── scripts/
    ├── deploy-coralogix.sh
    ├── deploy-otel-demo.sh
    └── validate.sh
```

## Security

Never commit Coralogix API keys, downloaded credential JSON files, Kubernetes Secret manifests with real values, or `.env`.

## Quick start

```bash
cp .env.example .env
# Edit .env locally
source .env

./scripts/deploy-coralogix.sh
./scripts/deploy-otel-demo.sh
./scripts/validate.sh
```
