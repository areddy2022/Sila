## Sila

A CLI for launching multinode infrastructure on AWS ParallelCluster.

### Install (local)

- With uv (recommended):
```bash
uv tool install .
sila --help
```

- Run without installing:
```bash
uv run python -m sila --help
```

- From GitHub (no publish required):
```bash
uvx --from 'git+https://github.com/deepsilicon/Sila@main' sila --help
```

Notes:
- The tool bundles AWS CLI and AWS ParallelCluster; no extra installs needed.
- `template.yaml` is packaged internally; `configure` renders a `config.yaml` into your current working directory.

### Quickstart

1) Authenticate to AWS:
```bash
sila login aws
```

2) Configure your cluster (interactive prompts):
```bash
sila configure cluster
```
You will be asked for:
- security key (name of your `.pem` file)
- public and private subnet IDs
- capacity reservation ID
- compute node type (0: p4d.24xlarge, 1: p4de.24xlarge, 2: p5d.48xlarge, 3: p5de.48xlarge)
- number of compute nodes

This generates `config.yaml` in the directory you run the command from.

3) Launch the cluster using the generated config:
```bash
sila launch cluster
# optionally name it
sila launch cluster -n my-cluster
```

### Commands

- `sila login aws`: Opens AWS CLI configure flow.
- `sila show capacity|subnets`: Helpful to discover values for configuration.
- `sila configure cluster`: Renders `config.yaml` from prompts.
- `sila launch cluster [-n NAME]`: Creates the cluster using `config.yaml` in the current directory.

### Uninstall / Upgrade

```bash
uv tool upgrade sila
uv tool uninstall sila
```
