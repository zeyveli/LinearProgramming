# 🧮 Linear Programming Solver using Simplex Algorithm (MATLAB)

This repository contains my implementation of a Linear Programming (LP) solver using the **Simplex Algorithm**, built for an optimization course homework assignment. The code supports both **one-phase** and **two-phase** simplex methods and can handle general LP problems by converting them to canonical form.

---

## 📂 Repository Structure

- `main.m` — The main script that loads input, determines the solving method, and returns the result.
- `LP_construct.m` — Initializes or loads the LP problem definition.
- `LP_format.m` — Converts the problem to standard form suitable for the simplex method.
- `canonic.m` — Transforms the LP into canonical form.
- `two_phase_simplex.m` — Solves LPs requiring a two-phase method.
- `one_phase_simplex.m` — Solves LPs solvable with a one-phase method.

---

## 🚀 Features

- Automatically detects whether to use one-phase or two-phase simplex.
- Converts general LP forms into canonical simplex-ready format.
- Handles unrestricted, non-negative, and non-positive variable types.
- Extracts the final variable values and objective function value.

---

## 🔧 Requirements

- MATLAB R2016b or later recommended
- No external toolboxes required

---

## 📌 How to Run

1. Clone or download the repository.
2. Open main.m in MATLAB.
3. Run the script: main.m

The script will output:
- The optimized variable values
- The final objective function value

---

## 📈 Example Output

the result is:
     3
     0
     1.5

the objective function is:
    -7.5

---

## ⚠️ Disclaimer
This project is intended for educational use only. Please do not submit this code directly for academic credit unless permitted by your institution’s policies.

---

## 📬 Contact
If you have any questions or suggestions, feel free to open an issue or fork the repo.
