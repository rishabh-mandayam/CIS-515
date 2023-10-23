function lpoly2 = subdivstep(lpoly)
    [m, n, l] = size(lpoly);
    lpoly2 = zeros(m, n, 2 * l);

    for i = 1:l
        cpoly = lpoly(:, :, i);
        [ud, ld] = subdecas(cpoly);
        lpoly2(:, :, 2 * i - 1) = ud;
        lpoly2(:, :, 2 * i) = ld;
    end
end