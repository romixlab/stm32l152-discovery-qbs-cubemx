## Qt Creator qbs template for STM32L152RBT6 Discovery with STM32CubeMX

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/6066470/14405308/7ff89e5a-fe94-11e5-8e21-73fec60bdcd2.jpg" alt="Board"/>
</p>
![l152](https://cloud.githubusercontent.com/assets/6066470/14405181/ac848a5e-fe91-11e5-9d2d-791e734469f1.png)
![l152-cube](https://cloud.githubusercontent.com/assets/6066470/14405212/517421fa-fe92-11e5-92e6-faf09bb96f70.png)

### Preparing environment
TBW

### Building
Just open `stm32l152-discovery-qbs-cubemx.qbs` in Qt Creator and press Debug. If everything is setted up correctly firmware will be built, flashed to the mcu and debug session will launch!

### Using STM32CubeMX
Open `STM32L152-Discovery.ioc` in Cube, configure everything you need and press `Generate code`, then open project in Qt Creator (or answer Yes to reload changes, if it is already opened). That's it, everything should work right away. Note that if you enable USB or FreeRTOS in Cube, you will need to change `Src/src.qbs` a little bit (add all the necessary headers and sources) see this repo for example (TBW soon!).
