/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Upload;

import org.apache.commons.fileupload.FileItem;

/**
 *
 * @author Admin
 */
public class UploadItem {
    FileItem item;
    String name;

    public UploadItem() {
    }

    public UploadItem(FileItem item, String name) {
        this.item = item;
        this.name = name;
    }

    public FileItem getItem() {
        return item;
    }

    public void setItem(FileItem item) {
        this.item = item;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
