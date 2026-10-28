# How Different Customers Shop: A Grocery Customer Analysis

*Project in progress: findings will be added as the analysis develops.*

**Tools:** PostgreSQL

## The question

How do different types of customers shop at a supermarket? This project uses a year of loyalty-card data to compare basket size, spend and shopping frequency across age, income and household type, and to explore what that means for what stores should stock.

## The data

- Source: *The Complete Journey*, a public grocery dataset from 84.51°, released through the [`completejourney`](https://github.com/bradleyboehmke/completejourney) R package
- One year (2017) of shopping by 2,469 households across 457 stores, with demographics for 801 of them
- Three tables:
  - `transactions`: 1.47M rows, one per product in a basket
  - `products`: 92k products with department, category and brand
  - `demographics`: age, income, household size and children for 801 households

The raw transactions file is too large for GitHub (over 100 MB), so it isn't included. Download the data from the source above, then run `setup.sql` to build the database.

## Data cleaning

*In progress.*

## Findings

*In progress.*

## Queries

All SQL is in `/queries`, numbered in the order it appears in this write-up.
