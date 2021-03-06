function [posterior] = tapas_sem_mixed_example_inversion(model, param)
%% Test 
%
% fp -- Pointer to a file for the test output, defaults to 1
%
% aponteeduardo@gmail.com
% copyright (C) 2015
%

n = 0;

n = n + 1;
if nargin < n
    model = 'seria';
end

n = n + 1;
if nargin < n
    param = 'mixedgamma';
end

[data] = load_data();

switch model
case 'seria'
    ptheta = tapas_sem_seria_ptheta(); 
    switch param
        case 'invgamma'
            ptheta.llh = @c_seria_multi_invgamma;
        case 'gamma'
            ptheta.llh = @c_seria_multi_gamma;
        case 'mixedgamma'
            ptheta.llh = @c_seria_multi_mixedgamma;
        case 'lognorm'
            ptheta.llh = @c_seria_multi_lognorm;
        case 'later'
            ptheta.llh = @c_seria_multi_later;
        case 'wald'
            ptheta.llh = @c_seria_multi_wald;
    end

    ptheta.jm = [...
        eye(19)
        zeros(3, 8) eye(3) zeros(3, 8)];
case 'prosa'
    ptheta = tapas_sem_prosa_ptheta(); % Choose at convinience.
    switch param
    case 'invgamma'
        ptheta.llh = @c_prosa_multi_invgamma;
    case 'gamma'
        ptheta.llh = @c_prosa_multi_gamma;
    case 'mixedgamma'
        ptheta.llh = @c_prosa_multi_mixedgamma;
    case 'lognorm'
        ptheta.llh = @c_prosa_multi_lognorm;
    case 'later'
        ptheta.llh = @c_prosa_multi_later;
    case 'wald'
        ptheta.llh = @c_prosa_multi_wald;
    end

    ptheta.jm = [...
        eye(15)
        zeros(3, 6) eye(3) zeros(3, 6)];
end

ptheta.x = eye(4);
ptheta.mixed = ones(4, 1)';
pars = struct();

pars.T = ones(4, 1) * linspace(0.1, 1, 8).^5;
pars.nburnin = 4000;
pars.niter = 4000;
pars.ndiag = 500;
pars.mc3it = 4;
pars.verbose = 1;

display(ptheta);
inference = struct();
tic
posterior = tapas_sem_mixed_estimate(data, ptheta, inference, pars);
toc

display(posterior);

end

function [data] = load_data()

f = mfilename('fullpath');
[tdir, ~, ~] = fileparts(f);

data = load(fullfile(tdir, 'data', 'example_data.mat'));

data = data.data;

end
