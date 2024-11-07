#!/usr/bin/env nextflow
import nextflow.util.KryoHelper

KryoHelper.register(WorkflowVariantFiltering) // to enable cache system

/*
========================================================================================
    pipeline name
========================================================================================
    GitHub : https://gitlab.com/TreeGenes/variant-filtering-pipeline
    Slack  : 

*/

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowVariantFiltering.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { VARIANT_FILTERING } from './workflows/variant_filtering'

//
// WORKFLOW: Run main nf-core/radseq analysis pipeline
//
workflow VARIANT_FILTERING_PIPELINE {
    VARIANT_FILTERING ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    VARIANT_FILTERING ()
}

/*
========================================================================================
    THE END
========================================================================================
*/