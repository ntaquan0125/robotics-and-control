function draw_cart(state)
    % Dimensions
    W = 1; % Cart width
    H = .5; % Cart height
    wr = .2; % Wheel radius
    mr = .3; % Mass radius
    L = 2;

    % Positions
    x = state(1);
    theta = state(3);
    y = wr/2 + H/2; % Cart vertical position
    w1x = x - .9*W/2;
    w1y = 0;
    w2x = x + .9*W/2 - wr;
    w2y = 0;

    px = x - L*sin(theta);
    py = y + L*cos(theta);

    plot([-10 10],[0 0],'k','LineWidth',1.5)
    hold on
    rectangle('Position',[x-W/2,y-H/2,W,H],'Curvature',.1,'FaceColor',[.5 0.5 1],'LineWidth',1)
    rectangle('Position',[w1x,w1y,wr,wr],'Curvature',1,'FaceColor',[0 0 0],'LineWidth',1)
    rectangle('Position',[w2x,w2y,wr,wr],'Curvature',1,'FaceColor',[0 0 0],'LineWidth',1)

    plot([x px],[y py],'k','LineWidth',1.5)

    rectangle('Position',[px-mr/2,py-mr/2,mr,mr],'Curvature',1,'FaceColor',[1 0.1 .1],'LineWidth',1)

    xlim([-5 5]);
    ylim([-3 3]);
    drawnow
    hold off