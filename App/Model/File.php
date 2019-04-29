<?php
/**
 * AgileOne - Power to Agile Development
 *
 * LICENSE
 *
 * All AgileOne source files are subject to GPL V3 license:
 * 1) You may use the Software for free and non-commercial use
 * 2) You may modify or propagate the source code of the Software
 * 3) Please purchase commercial license for support and consultation
 * For more license infomation, please read the file License.txt.
 *
 * @copyright  Copyright (c) 2010 AgileOne Team (http://code.google.com/p/agileone/)
 * @license    GNU General Public License V3 (http://www.gnu.org/licenses)
 * @version    2009-3-20 1.0
 * @version    2010-4-15 1.1 (change API name to write/updateConfig, and $filename includes file path)
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

class File {

	public function writeConfig($data, $filename) {
        $content = "";
        foreach ($data as $key => $value) {
            $content .= "$key = \"$value\"" . "\r\n";
        }
        $file = fopen($filename, "w");
        fwrite($file, $content);
        fclose($file);
        return 'successful';
    }

    public function updateConfig($data, $filename) {
        $content = parse_ini_file($filename);
        foreach ($data as $key => $value) {
            $content[$key] = $value;
        }
        $state = $this->writeConfig($content, $filename);
        return $state;
    }
     
    public function isWritable($filePath) {
        if (is_dir($filePath)) {
            $dir = $filePath;
            if ($fp = @fopen("$dir/test.txt", 'w')) {
                @fclose($fp);
                @unlink("$dir/test.txt");
                $writeable = true;
            } else {
                $writeable = false;
            }
        }
        else {
            if($fp = @fopen($filePath, 'a+')) {
                @fclose($fp);
                $writeable = true;
            }else {
                $writeable = false;
            }
        }
        return $writeable;
    }
}
?>