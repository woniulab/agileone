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
 * @version    2009-3-13 1.0
 * @author     DengQiang (http://www.51testing.com/?uid/275266)
 */

/* Define table object and relationship */
class Project extends Zend_Db_Table_Abstract {
    
    /** 
     * Define the table name and primary key
	*/
    protected $_name = 'project';
    protected $_primary = 'projectid';
    
    /**
     * Define the dependent table
     */
    protected $_dependentTables = array('UserProject', 'Knowledge', 'Version', 'Module', 'Platform', 'Milestone', 'Minutes', 'Proposal', 'Userstory', 'Testcase');
    
    /**
     * Define the reference map
     */
    protected $_referenceMap = array(
        'Customer' => array(
            'columns'	    => 'customerid',
            'refTableClass'	=> 'Customer',
            'refColumns'	=> 'customerid'
        )
    );
}
?>