# Contagious GitHub Action

This action generates a matrix of container image tags to be used by Copacetic for patching.

## Inputs

## `registry`

**Required** the name of the ghcr instance to pull images from.

## Outputs

## `matrix`

The matrix of container image tags to be used by Copacetic for patching.

## Example usage

```yaml
#TODO: include docker login step
uses: actions/duffney/contagious@v1
with:
  registry: 'ghcr.io/duffney'
  next-tag: "true"
```
