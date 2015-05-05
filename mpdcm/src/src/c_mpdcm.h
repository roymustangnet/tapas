/* aponteeduardo@gmail.com */
/* copyright (C) 2014 */

#ifndef C_MPDCM
#define C_MPDCM

#include "mpdcm.hcu"

#include <matrix.h>
#include <mex.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

void c_mpdcm_fmri_euler(mxArray **y, const mxArray **u,
    const mxArray **theta, const mxArray **ptheta);
    /* Integrates an array of dcm with input u, parameters theta, and priors
       ptheta.
     
       y -- Cell array output
       u -- Cell array of inputs
       theta -- Cell array of parameters
       ptheta -- Structure of priors
    */

void c_mpdcm_fmri_kr4(mxArray **y, const mxArray **u,
    const mxArray **theta, const mxArray **ptheta);
    /* Integrates an array of dcm with input u, parameters theta, and priors
       ptheta.
     
       y -- Cell array output
       u -- Cell array of inputs
       theta -- Cell array of parameters
       ptheta -- Structure of priors
    */

void c_mpdcm_fmri_bs(mxArray **y, const mxArray **u,
    const mxArray **theta, const mxArray **ptheta);
    /* Integrates an array of dcm with input u, parameters theta, and priors
       ptheta.
     
       y -- Cell array output
       u -- Cell array of inputs
       theta -- Cell array of parameters
       ptheta -- Structure of priors
    */

void
c_mpdcm_prepare_input(
    mxArray **y, const mxArray *u, const mxArray *theta, const mxArray *ptheta,
    ntegrator integ);

void
c_mpdcm_prepare_theta(const mxArray *theta, ThetaDCM *ctheta, MPFLOAT *dtheta);

void
c_mpdcm_prepare_ptheta(const mxArray *ptheta, void *vptheta, MPFLOAT *dptheta);

void
c_mpdcm_transfer_y(mxArray **y, MPFLOAT *cy, int nx, int ny, int nt, int nb);




#endif
