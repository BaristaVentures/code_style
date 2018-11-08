# Barista docs

Docs, guides and general info.

## Barista workflow

- [Project workflow](project-workflow.md)

## Logging

Use "[APP][FILE][METHOD]" as log tag or prefix for each `log.print`.

Example:
> [Sniffle][SubscriptionController][getSubscriptions] something happened in here.

## Code Comments

Do not comment private functions/attributes [detekt/comments](https://arturbosch.github.io/detekt/comments.html#commentoverprivatefunction) because function name should be self explanatory.

Use comments only when necesary.
