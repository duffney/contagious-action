# Contagious GitHub Action

This action generates a matrix of container image tags to be used by Copacetic for patching.

## Inputs

## `registry`

**Required** the name of the ghcr instance to pull images from.

## Outputs

## `images`

The matrix of container image tags to be used by Copacetic for patching.

## Example usage

```yaml
#TODO: include docker login step
uses: actions/duffney/contagious@main
with:
  contagious_version: '0.1.2'
  registry: 'ghcr.io/duffney'
```
