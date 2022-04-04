/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Upload;

import java.util.HashMap;
import java.util.List;
import org.apache.commons.fileupload.FileItem;

/**
 *
 * @author Minky
 */
public class EncFormResult{
    private HashMap<String, List<String>> formFields;
    private List<FileItem> fileItems;

    public HashMap<String, List<String>> getFormFields() {
        return formFields;
    }

    public List<FileItem> getFileItems() {
        return fileItems;
    }

    public EncFormResult() {
    }

    public EncFormResult(HashMap<String, List<String>> formFields, List<FileItem> fileItems) {
        this.formFields = formFields;
        this.fileItems = fileItems;
    }

    @Override
    public String toString() {
        return "EncFormResult{" + "formFields=" + formFields + ", fileItems=" + fileItems + '}';
    }
}