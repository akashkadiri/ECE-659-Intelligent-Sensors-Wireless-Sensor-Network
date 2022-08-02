import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.aodv.AodvRouter;
import inet.visualizer.contract.IIntegratedVisualizer;
import inet.physicallayer.wireless.common.contract.packetlevel.IRadioMedium;

network SafeNestSimulation
{
    parameters:
        @display("bgb=500,500;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        @figure[rcvdPkText2](type=indicatorText; pos=380,20; anchor=w; font=,12; textFormat="Packets received from Camera Snsr: %g"; initialValue=0);
        @statistic[packetReceived2](source=hostCameraSensor.app[0].packetSent; record=figure(count); targetFigure=rcvdPkText2);

        @figure[rcvdPkText3](type=indicatorText; pos=380,35; anchor=w; font=,12; textFormat="Packets received from PI Magnetic Snsr: %g"; initialValue=0);
        @statistic[packetReceived3](source=hostPIMagneticSensor.app[0].packetSent; record=figure(count); targetFigure=rcvdPkText3);

        @figure[rcvdPkText4](type=indicatorText; pos=380,50; anchor=w; font=,12; textFormat="Packets received from Motion sensor: %g"; initialValue=0);
        @statistic[packetReceived4](source=hostMotionSensor.app[0].packetSent; record=figure(count); targetFigure=rcvdPkText4);
        
        @figure[rcvdPkText1](type=indicatorText; pos=380,65; anchor=w; font=,12; textFormat="Packets received from Weather Snsr 1 (Humidity): %g"; initialValue=0);
        @statistic[packetReceivedFromUpper1](source=hostWeatherSensor1.wlan[0].mac.packetSentToUpper; record=figure(count); targetFigure=rcvdPkText1);

        @figure[rcvdPkText5](type=indicatorText; pos=380,80; anchor=w; font=,12; textFormat="Packets received from Weather Snsr 2 (Precipitation): %g"; initialValue=0);
        @statistic[packetReceived5](source=hostWeatherSensor2.app[0].packetSent; record=figure(count); targetFigure=rcvdPkText5);

        @figure[rcvdPkText6](type=indicatorText; pos=380,95; anchor=w; font=,12; textFormat="Packets received from Weather Snsr 3 (Temperature): %g"; initialValue=0);
        @statistic[packetReceived6](source=hostWeatherSensor3.app[0].packetSent; record=figure(count); targetFigure=rcvdPkText6);
        

    submodules:
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=24.192001,15.120001;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=482.832,128.016;is=s");
        }
        hostCameraSensor: AodvRouter {
            @display("p=101.80801,384.048;i=misc/securitycamera");
        }

        hostWirelessController: AodvRouter {
            @display("p=239.904,266.112;i=device/server2");
        }
        hostWeatherSensor1: AodvRouter {
            @display("p=324.57602,104.832;i=misc/thermometer");
        }
        hostWeatherSensor2: AodvRouter {
            @display("p=155.23201,74.592;i=misc/cloud");
        }
        hostWeatherSensor3: AodvRouter {
            @display("p=246.96,87.696;i=misc/sun");
        }
        hostMotionSensor: AodvRouter {
            @display("p=240.912,454.608;i=misc/sensor3;is=l");
        }
        hostPIMagneticSensor: AodvRouter {
            @display("p=398.16,183.45601;i=misc/house");
        }
        hostAccessPoint1: AodvRouter {
            @display("p=254.016,358.84802;i=device/accesspoint");
        }
        hostAccessPoint2: AodvRouter {
            @display("p=333.648,218.73601;i=device/accesspoint");
        }
        hostAccessPoint3: AodvRouter {
            @display("p=250.992,166.32;i=device/accesspoint");
        }
        hostAccessPoint4: AodvRouter {
            @display("p=181.44,323.56802;i=device/accesspoint");
        }

        radioMedium: <default("UnitDiskRadioMedium")> like IRadioMedium {
            parameters:
                @display("p=54.432003,73.584;is=s");
        }
}
