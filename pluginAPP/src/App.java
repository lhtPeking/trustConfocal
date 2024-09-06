import ij.IJ;
import ij.plugin.PlugIn;
import java.io.File;
import java.nio.file.Files;
import javax.swing.*;

public class App implements PlugIn {

    @Override
    public void run(String arg) {
        // 创建简单的 Swing 界面
        JFrame frame = new JFrame("ImageJ Macro Runner");
        frame.setSize(400, 200);
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        JPanel panel = new JPanel();
        frame.add(panel);
        placeComponents(panel);

        frame.setVisible(true);
    }

    private void placeComponents(JPanel panel) {
        panel.setLayout(null);

        JLabel label = new JLabel("Run ImageJ Macro");
        label.setBounds(10, 20, 200, 25);
        panel.add(label);

        JButton runMacroButton = new JButton("Run Macro");
        runMacroButton.setBounds(10, 80, 150, 25);
        panel.add(runMacroButton);

        // 为按钮添加监听器，点击后执行宏文件
        runMacroButton.addActionListener(e -> {
            try {
                // 读取并运行宏文件
                String macroPath = "../Macro/Macro.ijm.ijm.ijm"; // 请替换为你的宏文件路径
                File macroFile = new File(macroPath);
                String macro = new String(Files.readAllBytes(macroFile.toPath()));
                IJ.runMacro(macro);
            } catch (Exception ex) {
                IJ.showMessage("Error", "Failed to run macro: " + ex.getMessage());
            }
        });
    }
}
