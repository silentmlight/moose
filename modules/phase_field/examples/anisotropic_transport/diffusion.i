[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 40
  ny = 40
  xmin = -15.0
  ymin = -15.0
  xmax = 15.0
  ymax = 15.0
  elem_type = QUAD4
[]

[Variables]
  [./c]
    [./InitialCondition]
      type = SmoothCircleIC
      x1 = 0.0
      y1 = 0.0
      radius = 3
      int_width = 1
      invalue = 1
      outvalue = 0
    [../]
  [../]
[]

[Kernels]
  [./cres]
    type = MatAnisoDiffusion
    D_name = D
    variable = c
  [../]
  [./time]
    type = TimeDerivative
    variable = c
  [../]
[]

[Materials]
  [./D]
    type = ConstantAnisotropicMobility
    block = 0
    tensor = '.505 .495 .0
              .495 .505 .0
              .0   .0   .0'
    M_name = D
  [../]
[]

[Preconditioning]
  [./SMP]
   type = SMP
   full = true
  [../]
[]

[Executioner]
  type = Transient
  scheme = 'BDF2'

  solve_type = 'NEWTON'
  petsc_options_iname = '-pc_type -ksp_gmres_restart -sub_pc_type -pc_asm_overlap'
  petsc_options_value = 'asm         31      lu      1'

  l_max_its = 30
  l_tol = 1.0e-4
  nl_max_its = 50
  nl_rel_tol = 1.0e-10

  dt = 1.0
  num_steps = 20
[]

[Outputs]
  exodus = true
  print_linear_residuals = true
  print_perf_log = true
[]
