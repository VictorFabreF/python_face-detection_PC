hold on
plot(media_RATE(1, :), media_PSNR_W(1, :), '-o')
%plot(media_RATE(2, :), media_PSNR_W(2, :), '-*')
%plot(media_RATE(3, :), media_PSNR_W(3, :), '-x')
%plot(media_RATE(4, :), media_PSNR_W(4, :), '-s')
plot(media_RATE(5, :), media_PSNR_W(5, :), '-d')
%plot(media_RATE(6, :), media_PSNR_W(6, :), '-p')
plot(media_RATE(7, :), media_PSNR_W(7, :), '-h')
%legend('Wheight = 1', 'Wheight = 2', 'Wheight = 4', 'Wheight = 8', 'Wheight = 16', 'Wheight = 32', 'Wheight = 64')
legend('Weight = 1', 'Weight = 16', 'Weight = 64', 'Location', 'Best')
%title('Wheighted PSNR')
ylabel('PSNR_Y [dB]')
xlabel('Rate Y+U+V [bpov]')
grid on
hold off

figure
hold on
plot(media_RATE(1, :), media_PSNR(1, :), '-o')
%plot(media_RATE(2, :), media_PSNR(2, :), '-*')
%plot(media_RATE(3, :), media_PSNR(3, :), '-x')
%plot(media_RATE(4, :), media_PSNR(4, :), '-s')
plot(media_RATE(5, :), media_PSNR(5, :), '-d')
%plot(media_RATE(6, :), media_PSNR(6, :), '-p')
plot(media_RATE(7, :), media_PSNR(7, :), '-h')
%legend('Wheight = 1', 'Wheight = 2', 'Wheight = 4', 'Wheight = 8', 'Wheight = 16', 'Wheight = 32', 'Wheight = 64')
legend('Weight = 1', 'Weight = 16', 'Weight = 64', 'Location', 'Best')
%title('Overall PSNR')
ylabel('PSNR_Y [dB]')
xlabel('Rate Y+U+V [bpov]')
grid on
hold off

figure
hold on
plot(media_RATE(6, :), PSNR_ROI_W32(:, :, 1, 1), '-o')
plot(media_RATE(6, :), PSNR_ROI_W32(:, :, 1, 2), '-*')
plot(media_RATE(6, :), PSNR_ROI_W32(:, :, 1, 3), '-x')
plot(media_RATE(6, :), PSNR_ROI_W32(:, :, 1, 4), '-s')
plot(media_RATE(6, :), PSNR_ROI_W32(:, :, 1, 5), '-d')
legend('S_q = 0', 'S_q = 1', 'S_q = 2', 'S_q = 3', 'S_q = 4', 'Location', 'Best')
%title('ROI level PSNR wheight = 32')
ylabel('PSNR_Y [dB]')
xlabel('Rate Y+U+V [bpov]')
grid on
hold off