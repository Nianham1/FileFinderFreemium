using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using MessageBox = System.Windows.MessageBox;

namespace FileFinderFreemium
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

        }


        private void Tab2Button_Click(object sender, RoutedEventArgs e)
        {
            Tab2Window win2 = new Tab2Window();
            win2.Top = this.Top;
            win2.Left = this.Left;
            this.Hide();
            win2.Show();
        }

        private void GetDrives(object sender, EventArgs e)
        {
            DriveInfo[] allDrives = DriveInfo.GetDrives();
            List<string> drives = new List<string>();
            foreach (DriveInfo d in allDrives)
            {
                drives.Add(d.Name);
            }
        }

        private void FileExtensionHelpButton_Click(object sender, RoutedEventArgs e)
        {
            string fileExtensionMessage = @"The 'File Filter' is used to search for specific strings in files.

EXAMPLES
-------------------------------------------------
To find files called 'image.jpg', enter:
*image.jpg

To find files with a '.exe' extension, enter:
*.exe

Find files with 'workbook' in their name, enter:
*workbook *
-------------------------------------------------";

            MessageBox.Show(fileExtensionMessage);
        }

        private void DateRangeHelpButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Date range for the 'Last Modified' property of the file.\nLeave blank if you're looking for files from any time frame.");
        }

        class dataGridItems 
        { 
            public string fullPath { get; set; }
            public string folder { get; set; }
            public string fileName { get; set; }
            public string extension { get; set; }
            public long fileSize { get; set; }
            public DateTime lastModified { get; set; }

        }


        private void Button_Click(object sender, RoutedEventArgs e)


        {

            string dir = SelectDirTextBox.Text;
            string fileFilter = FileFilterTextBox.Text;
            string startDate = StartDateDatePicker.Text;
            string endDate = EndDateDatePicker.Text;

            List<dataGridItems> fileList = new List<dataGridItems>();

            // Clear datagrid of last output
            fileList = null;
            FileFinderDataGrid.ItemsSource = fileList;
            fileList = new List<dataGridItems>();

            // Set filefilter to * if empty
            if (fileFilter.Length == 0)
            {
                fileFilter = "*";
            }

            // Check if all necessary boxes were populated to search for files
            if (dir.Length == 0)
            {
                MessageBox.Show("Please select a directory first.");
                return;
            }

            // START FINDING FILES
            FileFinderStatusBar.Text = "Finding files...";

            foreach (string file in GetFiles(dir, fileFilter))
            {
                Regex pattern = new Regex(@"(\w{1}:\\.+\\)*(.+\.(.+))");

                Match match = pattern.Match(file);

                string fold = (match.Groups[1].Value);
                string fileN= (match.Groups[2].Value);
                string ext = (match.Groups[3].Value);

                try
                {
                    fileList.Add(new dataGridItems { fullPath = file, folder = fold, fileName = fileN, extension = ext, fileSize = new FileInfo(file).Length, lastModified = new FileInfo(file).LastWriteTime });
                }
                catch ( System.IO.FileNotFoundException) { };
            }

            FileFinderDataGrid.ItemsSource = fileList;

            // END FINDING FILES
            FileFinderStatusBar.Text = "Done.";
        }

        private void SelectButton_Click(object sender, RoutedEventArgs e)
        {
            using (FolderBrowserDialog dlg = new FolderBrowserDialog())
            {
                dlg.Description = "Select a folder";
                if (dlg.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                {
                    SelectDirTextBox.Text = dlg.SelectedPath;
                }
                
                
            }
        }

        public static IEnumerable<string> GetFiles(string root, string searchPattern)
        {
            Stack<string> pending = new Stack<string>();
            pending.Push(root);
            while (pending.Count != 0)
            {
                var path = pending.Pop();
                string[] next = null;
                try
                {
                    next = Directory.GetFiles(path, searchPattern);
                }
                catch { }
                if (next != null && next.Length != 0)
                    foreach (var file in next) yield return file;
                try
                {
                    next = Directory.GetDirectories(path);
                    foreach (var subdir in next) pending.Push(subdir);
                }
                catch { }
            }
        }

    }
}
