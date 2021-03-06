//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "ADComputeEigenstrainBase.h"

#define usingADComputeEigenstrainMembers usingComputeEigenstrainBaseMembers

/**
 * ComputeEigenstrain computes an Eigenstrain that is a function of a single variable defined by a
 * base tensor and a scalar function defined in a Derivative Material.
 */
class ADComputeEigenstrain : public ADComputeEigenstrainBase
{
public:
  static InputParameters validParams();

  ADComputeEigenstrain(const InputParameters & parameters);

protected:
  virtual void computeQpEigenstrain() override;

  const ADMaterialProperty<Real> & _prefactor;

  RankTwoTensor _eigen_base_tensor;
};
