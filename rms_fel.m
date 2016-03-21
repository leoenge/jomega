function fel = rms_fel( y_1, y_2 )
    fel = sqrt(1/length(y_1) * sum((y_1 - y_2).^2));
end

