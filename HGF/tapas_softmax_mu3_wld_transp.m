function [pvec, pstruct] = tapas_softmax_mu3_wld_transp(r, ptrans)
% --------------------------------------------------------------------------------------------------
% Copyright (C) 2018 Christoph Mathys, TNU, UZH & ETHZ
%
% This file is part of the HGF toolbox, which is released under the terms of the GNU General Public
% Licence (GPL), version 3. You can redistribute it and/or modify it under the terms of the GPL
% (either version 3 or, at your option, any later version). For further details, see the file
% COPYING or <http://www.gnu.org/licenses/>.

pvec    = NaN(1,length(ptrans));
pstruct = struct;

pvec(1)       = ptrans(1);         % la_wd
pstruct.la_wd = pvec(1);
pvec(2)       = ptrans(2);         % la_ld
pstruct.la_ld = pvec(2);

return;
