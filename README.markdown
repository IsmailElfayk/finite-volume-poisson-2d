# Finite Volume Method for Poisson's Equation 🚀

This MATLAB project implements a **Finite Volume Method (FVM)** to solve the 2D Poisson equation \(-\Delta u = f\) with Dirichlet boundary conditions. It supports triangular meshes, computes numerical solutions, and visualizes both exact and approximate results in 2D. 📊

## Table of Contents
- [Overview](#overview) ℹ️
- [Features](#features) ✨
- [Installation](#installation) 🛠️
- [Usage](#usage) ▶️
- [File Structure](#file-structure) 📂
- [Dependencies](#dependencies) 📚
- [Test Cases](#test-cases) 🧪
- [Contributing](#contributing) 🤝
- [License](#license) 📜

## Overview ℹ️
This project solves the 2D Poisson equation using a finite volume scheme on a triangular mesh. Users can select from predefined test cases with known exact solutions and source terms, compute the approximate solution, and visualize results. The code includes mesh handling, matrix assembly, and error analysis. 🧮

## Features ✨
- Solves the 2D Poisson equation \(-\Delta u = f\) with Dirichlet boundary conditions. ✅
- Supports multiple test cases with exact solutions and source terms. 🧪
- Reads triangular mesh data from predefined files. 🗺️
- Visualizes exact and approximate solutions in 2D. 📈
- Computes the maximum error (infinity norm) between solutions. 📏
- Allows mesh refinement selection (levels 1 to 12). 🔧

## Installation 🛠️
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/finite-volume-poisson.git
   ```
2. Ensure **MATLAB** (R2020a or later) is installed. 🖥️
3. Place mesh files in the `Mesh` folder (e.g., `maillage_triangle_<level>_aretes`, `maillage_triangle_<level>_centres`, `maillage_triangle_<level>_sommets`). 📁
4. Verify the folder structure (`Routines`, `Scheme_VF`, `Data`, `Mesh`) matches the expected paths.

## Usage ▶️
1. Open MATLAB and navigate to the project directory.
2. Run the `test.m` script:
   ```matlab
   run('test.m')
   ```
3. Follow the prompts to:
   - Select a test case (1 to 4). 🎯
   - Choose a mesh refinement level (1 to 12). 🔍
4. The script will:
   - Load the specified mesh. 🗺️
   - Compute the approximate solution using FVM. 🧮
   - Display the maximum error (infinity norm). 📏
   - Generate 2D visualizations for exact and approximate solutions. 📊

Alternatively, run `main.m` for a quick test with a fixed mesh level (default: `l = 3`). ⚡

## File Structure 📂
- **`main.m`**: Quick test script with a fixed mesh level. 🚀
- **`test.m`**: Interactive script for selecting test cases and mesh levels, computing solutions, and visualizing results. 🖱️
- **`schema_VF.m`**: Core FVM implementation for solving \(-\Delta u = f\). 🧮
- **`mesh_reader.m`**: Reads triangular mesh data and builds the mesh structure. 🗺️
- **`visualisation2D.m`**: Visualizes solutions on the triangular mesh in 2D. 📈
- **`Data.m`**: Defines exact solutions and source terms for test cases. 📚
- **`structure.m`**: Configures test cases (names, source terms, exact solutions). 🛠️

### Directory Structure
```
finite-volume-poisson/
├── Data/ 📁
│   ├── Data.m
│   └── structure.m
├── Mesh/ 📁
│   └── maillage_triangle_<level>_*.mat
├── Routines/ 📁
│   ├── mesh_reader.m
│   └── visualisation2D.m
├── Scheme_VF/ 📁
│   └── schema_VF.m
├── main.m
├── test.m
└── README.md 📜
```

## Dependencies 📚
- **MATLAB** (R2020a or later recommended). 🖥️
- Mesh files in the `Mesh` folder (e.g., `maillage_triangle_<level>_aretes`, etc.). 📁
- No external libraries required. ✅

## Test Cases 🧪
The project includes four test cases defined in `Data.m` and `structure.m`:
1. **Test 1**: Exact solution \(u(x,y) = (x^2 - x)(y^2 - y)\), source term \(f(x,y) = -2(x^2 + y^2) + 2(x + y)\). 📝
2. **Test 2**: Exact solution \(u(x,y) = \sin(\pi x)\sin(\pi y)\), source term \(f(x,y) = 2\pi^2 \sin(\pi x)\sin(\pi y)\). 📝
3. **Test 3**: Exact solution \(u(x,y) = x^2 + y^2\), source term \(f(x,y) = -4\). 📝
4. **Test 4**: Exact solution \(u(x,y) = e^{x+y}\), source term \(f(x,y) = -2e^{x+y}\). 📝

## Contributing 🤝
Contributions are welcome! To contribute:
1. Fork the repository. 🍴
2. Create a feature branch (`git checkout -b feature/your-feature`). 🌱
3. Commit your changes (`git commit -m 'Add your feature'`). 💾
4. Push to the branch (`git push origin feature/your-feature`). 🚀
5. Open a pull request. 📬

## License 📜
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details. ✅