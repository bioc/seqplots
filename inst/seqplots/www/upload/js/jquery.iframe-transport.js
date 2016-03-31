/*
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
 * jQuery Iframe Transport Plugin 1.8.3
=======
 * jQuery Iframe Transport Plugin 1.6.1
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2011, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */

<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
/* global define, require, window, document */
=======
/*jslint unparam: true, nomen: true */
/*global define, window, document */
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.

(function (factory) {
    'use strict';
    if (typeof define === 'function' && define.amd) {
        // Register as an anonymous AMD module:
        define(['jquery'], factory);
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
    } else if (typeof exports === 'object') {
        // Node/CommonJS:
        factory(require('jquery'));
=======
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
    } else {
        // Browser globals:
        factory(window.jQuery);
    }
}(function ($) {
    'use strict';

    // Helper variable to create unique names for the transport iframes:
    var counter = 0;

<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
    // The iframe transport accepts four additional options:
=======
    // The iframe transport accepts three additional options:
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
    // options.fileInput: a jQuery collection of file input fields
    // options.paramName: the parameter name for the file form data,
    //  overrides the name property of the file input field(s),
    //  can be a string or an array of strings.
    // options.formData: an array of objects with name and value properties,
    //  equivalent to the return data of .serializeArray(), e.g.:
    //  [{name: 'a', value: 1}, {name: 'b', value: 2}]
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
    // options.initialIframeSrc: the URL of the initial iframe src,
    //  by default set to "javascript:false;"
    $.ajaxTransport('iframe', function (options) {
        if (options.async) {
            // javascript:false as initial iframe src
            // prevents warning popups on HTTPS in IE6:
            /*jshint scripturl: true */
            var initialIframeSrc = options.initialIframeSrc || 'javascript:false;',
            /*jshint scripturl: false */
                form,
=======
    $.ajaxTransport('iframe', function (options) {
        if (options.async) {
            var form,
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
                iframe,
                addParamChar;
            return {
                send: function (_, completeCallback) {
                    form = $('<form style="display:none;"></form>');
                    form.attr('accept-charset', options.formAcceptCharset);
                    addParamChar = /\?/.test(options.url) ? '&' : '?';
                    // XDomainRequest only supports GET and POST:
                    if (options.type === 'DELETE') {
                        options.url = options.url + addParamChar + '_method=DELETE';
                        options.type = 'POST';
                    } else if (options.type === 'PUT') {
                        options.url = options.url + addParamChar + '_method=PUT';
                        options.type = 'POST';
                    } else if (options.type === 'PATCH') {
                        options.url = options.url + addParamChar + '_method=PATCH';
                        options.type = 'POST';
                    }
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
                    // IE versions below IE8 cannot set the name property of
                    // elements that have already been added to the DOM,
                    // so we set the name along with the iframe HTML markup:
                    counter += 1;
                    iframe = $(
                        '<iframe src="' + initialIframeSrc +
                            '" name="iframe-transport-' + counter + '"></iframe>'
=======
                    // javascript:false as initial iframe src
                    // prevents warning popups on HTTPS in IE6.
                    // IE versions below IE8 cannot set the name property of
                    // elements that have already been added to the DOM,
                    // so we set the name along with the iframe HTML markup:
                    iframe = $(
                        '<iframe src="javascript:false;" name="iframe-transport-' +
                            (counter += 1) + '"></iframe>'
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
                    ).bind('load', function () {
                        var fileInputClones,
                            paramNames = $.isArray(options.paramName) ?
                                    options.paramName : [options.paramName];
                        iframe
                            .unbind('load')
                            .bind('load', function () {
                                var response;
                                // Wrap in a try/catch block to catch exceptions thrown
                                // when trying to access cross-domain iframe contents:
                                try {
                                    response = iframe.contents();
                                    // Google Chrome and Firefox do not throw an
                                    // exception when calling iframe.contents() on
                                    // cross-domain requests, so we unify the response:
                                    if (!response.length || !response[0].firstChild) {
                                        throw new Error();
                                    }
                                } catch (e) {
                                    response = undefined;
                                }
                                // The complete callback returns the
                                // iframe content document as response object:
                                completeCallback(
                                    200,
                                    'success',
                                    {'iframe': response}
                                );
                                // Fix for IE endless progress bar activity bug
                                // (happens on form submits to iframe targets):
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
                                $('<iframe src="' + initialIframeSrc + '"></iframe>')
                                    .appendTo(form);
                                window.setTimeout(function () {
                                    // Removing the form in a setTimeout call
                                    // allows Chrome's developer tools to display
                                    // the response result
                                    form.remove();
                                }, 0);
=======
                                $('<iframe src="javascript:false;"></iframe>')
                                    .appendTo(form);
                                form.remove();
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
                            });
                        form
                            .prop('target', iframe.prop('name'))
                            .prop('action', options.url)
                            .prop('method', options.type);
                        if (options.formData) {
                            $.each(options.formData, function (index, field) {
                                $('<input type="hidden"/>')
                                    .prop('name', field.name)
                                    .val(field.value)
                                    .appendTo(form);
                            });
                        }
                        if (options.fileInput && options.fileInput.length &&
                                options.type === 'POST') {
                            fileInputClones = options.fileInput.clone();
                            // Insert a clone for each file input field:
                            options.fileInput.after(function (index) {
                                return fileInputClones[index];
                            });
                            if (options.paramName) {
                                options.fileInput.each(function (index) {
                                    $(this).prop(
                                        'name',
                                        paramNames[index] || options.paramName
                                    );
                                });
                            }
                            // Appending the file input fields to the hidden form
                            // removes them from their original location:
                            form
                                .append(options.fileInput)
                                .prop('enctype', 'multipart/form-data')
                                // enctype must be set as encoding for IE:
                                .prop('encoding', 'multipart/form-data');
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
                            // Remove the HTML5 form attribute from the input(s):
                            options.fileInput.removeAttr('form');
=======
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
                        }
                        form.submit();
                        // Insert the file input fields at their original location
                        // by replacing the clones with the originals:
                        if (fileInputClones && fileInputClones.length) {
                            options.fileInput.each(function (index, input) {
                                var clone = $(fileInputClones[index]);
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
                                // Restore the original name and form properties:
                                $(input)
                                    .prop('name', clone.prop('name'))
                                    .attr('form', clone.attr('form'));
=======
                                $(input).prop('name', clone.prop('name'));
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
                                clone.replaceWith(input);
                            });
                        }
                    });
                    form.append(iframe).appendTo(document.body);
                },
                abort: function () {
                    if (iframe) {
                        // javascript:false as iframe src aborts the request
                        // and prevents warning popups on HTTPS in IE6.
                        // concat is used to avoid the "Script URL" JSLint error:
                        iframe
                            .unbind('load')
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
                            .prop('src', initialIframeSrc);
=======
                            .prop('src', 'javascript'.concat(':false;'));
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
                    }
                    if (form) {
                        form.remove();
                    }
                }
            };
        }
    });

    // The iframe transport returns the iframe content document as response.
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
    // The following adds converters from iframe to text, json, html, xml
    // and script.
    // Please note that the Content-Type for JSON responses has to be text/plain
    // or text/html, if the browser doesn't include application/json in the
    // Accept header, else IE will show a download dialog.
    // The Content-Type for XML responses on the other hand has to be always
    // application/xml or text/xml, so IE properly parses the XML response.
    // See also
    // https://github.com/blueimp/jQuery-File-Upload/wiki/Setup#content-type-negotiation
=======
    // The following adds converters from iframe to text, json, html, and script:
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
    $.ajaxSetup({
        converters: {
            'iframe text': function (iframe) {
                return iframe && $(iframe[0].body).text();
            },
            'iframe json': function (iframe) {
                return iframe && $.parseJSON($(iframe[0].body).text());
            },
            'iframe html': function (iframe) {
                return iframe && $(iframe[0].body).html();
            },
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
            'iframe xml': function (iframe) {
                var xmlDoc = iframe && iframe[0];
                return xmlDoc && $.isXMLDoc(xmlDoc) ? xmlDoc :
                        $.parseXML((xmlDoc.XMLDocument && xmlDoc.XMLDocument.xml) ||
                            $(xmlDoc.body).html());
            },
=======
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
            'iframe script': function (iframe) {
                return iframe && $.globalEval($(iframe[0].body).text());
            }
        }
    });

}));
